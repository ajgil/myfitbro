import 'package:myfitbro/config/app_layout.dart';
import 'package:myfitbro/features/common/presentation/widgets/app_error.dart';
import 'package:myfitbro/features/departments/application/departments_delete_controller.dart';
import 'package:myfitbro/features/departments/application/departments_list_controller.dart';
import 'package:myfitbro/features/departments/presentation/screens/departments_create_screen.dart';
import 'package:myfitbro/features/departments/presentation/screens/departments_edit_screen.dart';
import 'package:myfitbro/features/departments/presentation/screens/departments_view_screen.dart';
import 'package:myfitbro/features/organization/domain/entities/organization_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Departments list
class DepartmentsList extends ConsumerWidget {
  /// Departments list constructor
  const DepartmentsList({
    required this.organization,
    super.key,
  });

  ///
  final OrganizationEntity organization;

  ///

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departments = ref.watch(departmentsListControllerProvider);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        OutlinedButton(
          child: const Text('Create'),
          onPressed: () => context.goNamed(
            DepartmentsCreateScreen.routeName,
            pathParameters: {'oid': organization.id!},
          ),
        ),
        departments.when(
          data: (items) => items.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('No items found'),
                  ),
                )
              : Flexible(
                  child: ListView.separated(
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                      children: [
                        InkWell(
                          child: Text(items[index].id!),
                          onTap: () => context.goNamed(
                            DepartmentsViewScreen.routeName,
                            pathParameters: {
                              'did': items[index].id!,
                              'oid': organization.id!,
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(items[index].name),
                        IconButton(
                          onPressed: () => context.goNamed(
                            DepartmentsEditScreen.routeName,
                            pathParameters: {
                              'did': items[index].id!,
                              'oid': organization.id!,
                            },
                          ),
                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: const Text('Please Confirm'),
                                  content: const Text(
                                    'Are you sure to remove department?',
                                  ),
                                  actions: [
                                    // The "Yes" button
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                              departmentsDeleteControllerProvider(
                                                items[index].id!,
                                              ).notifier,
                                            )
                                            .handle();
                                        ref
                                            .read(
                                              departmentsListControllerProvider.notifier,
                                            )
                                            .deleteDepartment(items[index]);
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('No'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: AppLayout.defaultPadding / 2,
                    ),
                  ),
                ),
          error: (o, e) => AppError(
            title: o.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
