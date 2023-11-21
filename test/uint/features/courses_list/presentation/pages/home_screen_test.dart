import 'package:clean_architecture_flutter/di.dart';
import 'package:clean_architecture_flutter/features/courses_list/data/model/course.dart';
import 'package:clean_architecture_flutter/features/courses_list/domain/entities/courses.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/bloc/courses_list_bloc.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/pages/home_screen.dart';
import 'package:clean_architecture_flutter/features/courses_list/presentation/widgets/course_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../route/app_route_test.mocks.dart';

void main() {
  final course1 = Course(
    img: 'course_image1.jpg',
    name: 'Course 1',
    id: 1,
    category: 'Programming',
    viewerQuntity: 100,
    numberOfVideos: 10,
    teacherId: 101,
    teacherImage: 'teacher_image1.jpg',
  );

  final course2 = Course(
    img: 'course_image2.jpg',
    name: 'Course 2',
    id: 2,
    category: 'Math',
    viewerQuntity: 50,
    numberOfVideos: 8,
    teacherId: 102,
    teacherImage: 'teacher_image2.jpg',
  );

  final coursesResponse = Courses(
    success: true,
    message: 'Success',
    courses: [course1, course2],
  );
setUp(() async =>  await MockAppDependencies().initialize());
  testWidgets('HomeScreen should render correctly',
      (WidgetTester tester) async {
    final mockSharedPreferences = MockSharedPreferences();
    // Build the widget and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));

    // Verify that the widget shows correctly
    expect(find.text('Title'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(Center), findsNWidgets(3));

    // Simulate a tap on the FloatingActionButton to clear SharedPreferences
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify that SharedPreferences.clear() was called
    verify(mockSharedPreferences.clear()).called(1);
  });

  testWidgets(
      'HomeScreen should render CourseDesignWidget when CoursesListLoaded',
      (WidgetTester tester) async {
    // Create a mock CoursesListBloc
    CoursesListBloc coursesListBloc = getIt<CoursesListBloc>();

    // Set up the initial state to be CoursesListLoaded
    when(coursesListBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([CoursesListLoaded(coursesResponse)]));
    // Build the widget and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<CoursesListBloc>(
        create: (context) => coursesListBloc,
        child: HomeScreen(),
      ),
    ));

    // Verify that the CourseDesignWidget is displayed
    expect(find.byType(CourseDesignWidget), findsOneWidget);
  });
}
