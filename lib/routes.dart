import 'package:flutter/material.dart';
import 'package:profe_app/screens/customer_operations_screen.dart';
import 'package:profe_app/screens/task_assignment.dart';

final routes = {
  '/': (BuildContext context) => new CustomerOperationsScreen(),
  '/assignment': (BuildContext context) => new TaskAssignmentScreen(),
};
