import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/stores/language/language_store.dart';
import 'package:work_app/stores/theme/theme_store.dart';
import 'package:work_app/stores/work/work_store.dart';
import 'package:work_app/ui/home/character_list_item.dart';
import 'package:work_app/utils/locale/app_localization.dart';
import 'package:work_app/utils/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  late WorkStore _store;
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  static const _pageSize = 10;

  final PagingController<int, Work> _pagingController =
      PagingController(firstPageKey: 0);

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
      body: _buildBody(),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context).translate('home_tv_posts')),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLanguageButton(),
      _buildThemeButton(),
      _buildLogoutButton(),
    ];
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () async {
         await _store.logout();
        Navigator.of(context).pushReplacementNamed(Routes.login);

      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }

  Widget _buildLanguageButton() {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog();
      },
      icon: Icon(
        Icons.language,
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainPaging,
      ],
    );
  }

  Widget get _buildMainPaging => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, Work>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Work>(
            itemBuilder: (context, item, index) => WorkListItem(
              work: item,
            ),
          ),
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
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      headerColor: Theme.of(context).primaryColor,
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
              contentPadding: EdgeInsets.all(0.0),
              title: Text(
                object.language!,
                style: TextStyle(
                  color: _languageStore.locale == object.locale
                      ? Theme.of(context).primaryColor
                      : _themeStore.darkMode ? Colors.white : Colors.black,
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