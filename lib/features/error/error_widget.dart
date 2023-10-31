


// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/theme/custom_text_style.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(
          bloc: context.read<ScanScreenPageBloc>(),
          builder: (context, state) {
            if(state is ScanScreenFailure){
              return Text(state.message, style: CustomTextStyles.errorLarge);
            } else {
              return Container();
            }

    });
  }
}