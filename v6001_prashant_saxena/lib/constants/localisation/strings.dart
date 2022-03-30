import 'package:flutter/widgets.dart';

abstract class Strings {
  String get WhatsApp;
  String get French;
  String get English;
  String get Chats;
  String get Status;
  String get Calls;
  String get StorageAndData;
  String get Notification;
  String get NewGroup;
  String get NewBroadcast;
  String get LinkedDevice;
  String get StarredMessages;
  String get Payments;
  String get Settings;
  String get StatusPrivacy;
  String get ClearCallLogs;
  String get CallInfo;
  String get ArchivedSetting;
  String get KeepChatsArchived;
  String get ArchivedScreenMsg;
  String get Archived;
  String get SelectContacts;
  String get Contacts;
  String get InviteFriend;
  String get Refresh;
  String get Help;
  String get NewContact;
  String get UseWpOnOtherDevice;
  String get LinkADevice;
  String get MultiDeviceBeta;
  String get MultiDeviceMsg;
  String get Selected;
  String get NewBroadcastMsg;
  String get NewWhatsAppContacts;
  String get AddParticipants;
  String get MyStatus;
  String get Privacy;
  String get Account;
  String get Security;
  String get TwoStepVerification;
  String get ChangeNumber;
  String get RequestAcoountInfo;
  String get DeleteMyAccount;
  String get AppLang;
  String get HelpCentre;
  String get ContactUs;
  String get QuestionsNeedHelp;
  String get TermsAndPrivacyPolicy;
  String get AppInfo;
  String get ChatHint;
  String get AccountHint;
  String get NotificationHint;
  String get StorageHint;
  String get HelpHint;
  String get Theme;
  String get Dark;
  String get Light;


  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }
}