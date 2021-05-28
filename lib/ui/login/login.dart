import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_app/data/sharedpref/constants/preferences.dart';
import 'package:work_app/stores/form/form_store.dart';
import 'package:work_app/stores/theme/theme_store.dart';
import 'package:work_app/ui/splash/splash.dart';
import 'package:work_app/utils/device/device_utils.dart';
import 'package:work_app/utils/locale/app_localization.dart';
import 'package:work_app/utils/routes/routes.dart';
import 'package:work_app/widgets/logo_widget.dart';
import 'package:work_app/widgets/progress_indicator_widget.dart';
import 'package:work_app/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late FormStore _store;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------


  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
    _store = Provider.of<FormStore>(context);

    var userName = "task";
    var password = "task1234";
    _store.userName = userName;
    _store.password = password;
    _userEmailController.value =TextEditingValue(text: userName);
    _passwordController.value =TextEditingValue(text: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF03B99B),
            Color(0xFF346BB6),
          ],
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomPaint(

                size: Size(DeviceUtils.getScaledWidth(context, 0.8), DeviceUtils.getScaledWidth(context, 0.8).toDouble()),
                painter: LogoPainter(),
              ),
              Observer(
                builder: (context) {
                  return _store.success
                      ? navigate(context)
                      : _showErrorMessage(_store.errorStore.errorMessage);
                },
              ),
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: _store.loading,
                    child: CustomProgressIndicatorWidget(),
                  );
                },
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Color(0x26FFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      _buildUserIdField(),
                      SizedBox(height: 20),
                      _buildPasswordField(),
                      SizedBox(height: 20),
                      Align(
                          child: Text("Now! Quick login use your touch ID",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white)),
                          alignment: Alignment(-1, 2)),
                      SizedBox(height: 50),
                      ButtonTextWidget(
                        borderRadius: 100,
                        label: 'register',
                        padding: EdgeInsets.zero,
                        onTap: () {
                          _store.login();
                        },
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint:"Enter your name",
          inputType: TextInputType.emailAddress,
          icon: Icons.person_add_outlined,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint:"Enter your Password",
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock_outline,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
          onChanged: (value) {
            _store.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration.zero, () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
