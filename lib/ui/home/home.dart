import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:work_app/constants/colors.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/stores/language/language_store.dart';
import 'package:work_app/stores/theme/theme_store.dart';
import 'package:work_app/stores/work/work_store.dart';
import 'package:work_app/ui/home/character_list_item.dart';
import 'package:work_app/ui/login/search.dart';
import 'package:work_app/utils/locale/app_localization.dart';
import 'package:work_app/utils/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const double _actionPadding = 6.0;

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  late WorkStore _store;
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  static const _pageSize = 10;

  final PagingController<int, Work> _pagingController =
      PagingController(firstPageKey: 0);

  String? _searchTerm;

  Future<void> _fetchPage(int pageKey) async {
    try {
      await _store.getWorks(pageKey);
      final newItems = _store.workList;
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
      print("error");
      print(error);
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _store = Provider.of<WorkStore>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody,
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(_actionPadding),
        child: _buildCardButton(),
      ),
      title: Text(AppLocalizations.of(context).translate('home_title')),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(_actionPadding),
        child: _buildLanguageButton(),
      ),
      Padding(
        padding: const EdgeInsets.all(_actionPadding),
        child: _buildThemeButton(),
      ),
    ];
  }

  Widget _buildThemeButton() {
    return Observer(
        builder: (context) => Ink(
            decoration: const ShapeDecoration(
              color: AppColors.blue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              color: AppColors.white,
              splashColor: AppColors.blue,
              onPressed: () {
                _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
              },
              icon: Icon(
                _themeStore.darkMode
                    ? Icons.brightness_5_outlined
                    : Icons.brightness_3_outlined,
                color: AppColors.white,
              ),
            )));
  }

  Widget _buildLogoutButton() => Ink(
      decoration: const ShapeDecoration(
        color: AppColors.blue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: AppColors.white,
        onPressed: () async {
          await _store.logout();
          Navigator.of(context).pushReplacementNamed(Routes.login);
        },
        icon: Icon(
          Icons.logout,
        ),
      ));

  Widget _buildLanguageButton() => Ink(
      decoration: const ShapeDecoration(
        color: AppColors.blue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: AppColors.white,
        onPressed: () {
          _buildLanguageDialog();
        },
        icon: Icon(
          Icons.language,
        ),
      ));

  Widget _buildCardButton() => Ink(
      decoration: const ShapeDecoration(
        color: AppColors.blue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: AppColors.white,
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart_outlined,
        ),
      ));

  // body methods:--------------------------------------------------------------
  Widget get _buildBody => Stack(
        children: <Widget>[
          _handleErrorMessage(),
          _buildMainPaging,
        ],
      );

  void _updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    _pagingController.refresh();
  }

  Widget get _buildMainPaging => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            WorkSearchInputSliver(
              onChanged: _updateSearchTerm,
            ),
            PagedSliverList<int, Work>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Work>(
                itemBuilder: (context, item, index) => WorkListItem(
                  work: item,
                ),
              ),
            )
          ],
        ),
      );

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_store.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_store.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration.zero, () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }

_buildLanguageDialog() {
  _showDialog<String>(
    context: context,
    child: MaterialDialog(
      borderRadius: 5.0,
      enableFullWidth: true,
      title: Text(
        AppLocalizations.of(context).translate('home_tv_choose_language'),
      ),
      headerColor: AppColors.blue,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      closeButtonColor: Colors.white,
      enableCloseButton: true,
      enableBackButton: false,
      onCloseButtonClicked: () {
        Navigator.of(context).pop();
      },
      children: _languageStore.supportedLanguages
          .map(
            (object) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              selectedTileColor: AppColors.blue.withOpacity(0.5),
              selected:  _languageStore.locale == object.locale,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  object.language!,
                  style: TextStyle(
                    color: _languageStore.locale == object.locale
                        ? _themeStore.darkMode ? Colors.white : Colors.black
                        : _themeStore.darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              onTap: () {
                 Navigator.of(context).pop();
                // change user language based on selected locale
                _languageStore.changeLanguage(object.locale!);
              },
            ),
          )
          .toList(),
    ),
  );
}

  _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}