import 'package:flutter/widgets.dart';
import 'package:new_project/src/Screens/Login/login.dart';
import 'package:new_project/src/Screens/Login/otp.dart';
import 'package:new_project/src/Screens/Login/registration.dart';
import 'package:new_project/src/Screens/Profile/components/profile_form.dart';
import 'package:new_project/src/Screens/Profile/profile_screen.dart';
import 'package:new_project/src/Screens/group/addmember.dart';
import 'package:new_project/src/Screens/group/creategroup.dart';
import 'package:new_project/src/Screens/homepage.dart';
import 'package:new_project/src/Screens/products/components/posting_product.dart';
import 'package:new_project/src/Screens/products/components/product_details.dart';
import 'package:new_project/src/Screens/products/products_screens.dart';
import 'package:universal_html/js.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ProfileForm.routerName: (context) => ProfileForm(),
  Products.routerName: (context) => const Products(),
  Profile.routerName: (context) => const Profile(),
  loginScreen.routeName: (context) => loginScreen(),
  registrationScreen.routeName: (context) => registrationScreen(),
  OtpVerify.routerName: (context) => OtpVerify(),
  Homepage.routerName: (context) => const Homepage(
        value: '',
      ),
  PostingProduct.routerName: (context) => const PostingProduct(),
  ProductDetails.routerName: (context) => const ProductDetails(),
  CreateGroup.routerName: (contex) => const CreateGroup(),
  AddMember.routerName: (context) => const AddMember(
        membersList: [],
      ),
};
