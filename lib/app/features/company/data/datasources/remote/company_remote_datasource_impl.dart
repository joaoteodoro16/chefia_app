import 'package:chefia_app/app/core/exceptions/app_exception.dart';
import 'package:chefia_app/app/core/exceptions/dio_exception_message_mapper.dart';
import 'package:chefia_app/app/core/rest_client/app_end_points.dart';
import 'package:chefia_app/app/core/rest_client/app_rest_client.dart';
import 'package:chefia_app/app/core/rest_client/status_code.dart';
import 'package:chefia_app/app/features/company/data/datasources/remote/company_remote_datasource.dart';
import 'package:chefia_app/app/features/company/data/models/create_company_dto.dart';
import 'package:dio/dio.dart';

class CompanyRemoteDatasourceImpl extends CompanyRemoteDatasource {
  final AppRestClient _restClient;

  CompanyRemoteDatasourceImpl({required AppRestClient restClient})
    : _restClient = restClient;

  @override
  Future<void> createCompany({
    required CreateCompanyDto createCompanyDto,
  }) async {
    try {
      final response = await _restClient.auth().post(
        AppEndPoints.createCompany,
        data: createCompanyDto.toJson(),
      );

      if (response.statusCode != StatusCode.created.code) {
        throw AppException(response.data['message']);
      }
    } on AppException catch (_) {
      rethrow;
    } on DioException catch (e) {
      throw AppException(DioExceptionMessageMapper.map(e));
    } catch (e) {
      throw AppException("Ocorreu um erro inesperado. Tente novamente.");
    }
  }
}
