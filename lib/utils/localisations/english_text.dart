import 'package:flutter/cupertino.dart';

import 'strings.dart';

class EnglishText extends Strings {
  @override
  String get WhatsApp => "WhatsApp";

  @override
  String get Chats => 'CHATS';

  @override
  String get NewGroup => "NewGroup";

  @override
  String get NewBroadcast => "New Broadcast";

  @override
  // TODO: implement Calls
  String get Calls => "CALLS";

  @override
  // TODO: implement Status
  String get Status => "STATUS";

  @override
  // TODO: implement ClearCallLogs
  String get ClearCallLogs => "Clear call logs";

  @override
  // TODO: implement LinkedDevice
  String get LinkedDevice => "Linked Devices";

  @override
  // TODO: implement Payments
  String get Payments => "Payments";

  @override
  // TODO: implement Settings
  String get Settings => "Settings";

  @override
  // TODO: implement StarredMessages
  String get StarredMessages => "Starred Messages";

  @override
  // TODO: implement StatusPrivacy
  String get StatusPrivacy => "Status Privacy";

  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

}

