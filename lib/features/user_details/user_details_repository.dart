

// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_local_datsource.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/data/user_details_remote_datasource.dart';

abstract class IUserDetailsRepository {

  Future<Either<Failure, String>> getUserID();
}


class UserDetailsRepository extends IUserDetailsRepository {
  final IUserDetailsLocalDatasource localDS;
  final IUserDetailsRemoteDatasource remoteDS;

  UserDetailsRepository(this.localDS, this.remoteDS);
  
  @override
  Future<Either<Failure, String>> getUserID() async {
    try{
      var result = await remoteDS.getUserId();
      return  result;
    }catch(e){
      return Left(RepositoryFailure());
    }
  }



}