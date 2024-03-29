import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/utils.dart';
import '../../../../base/base.dart';
import '../../../../common_widget/export.dart';
import '../../../../extentions/extention.dart';
import '../../../../theme/theme_color.dart';
import '../bloc/add_member_bloc.dart';

part 'add_member.action.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends StateBase<AddMemberScreen>
    with AfterLayoutMixin {
  @override
  AddMemberBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  late AppLocalizations trans;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return BlocConsumer<AddMemberBloc, AddMemberState>(
      listener: _blocListener,
      builder: (context, state) {
        return ScreenForm(
          headerColor: themeColor.primaryColor,
          titleColor: themeColor.white,
          title: trans.inviteMember.capitalizeFirstofEach(),
          onBack: () {
            hideLoading();
            Navigator.pop(context);
          },
          child: _buildListing(state),
        );
      },
    );
  }

  Widget _buildListing(AddMemberState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            trans.useInvitationCodeBelow,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          BoxColor(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            color: themeColor.primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    state.invitationCode ?? '--',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text: state.invitationCode,
                      ),
                    );
                    showToast(trans.copied);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showLoading();

    bloc.add(GetInvitationCodeEvent());
  }
}
