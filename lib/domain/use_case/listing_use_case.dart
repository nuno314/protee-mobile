import '../../common/constants.dart';
import '../entities/pagination.entity.dart';

class ListingUseCase<T, P> {
  final Future<List<T>> Function(int offset, int limit, [P? param])
      _getPaginationData;

  var _pagination = Pagination();
  final _data = <T>[];

  final int? _fetchLimit;

  int get fetchLimit => _fetchLimit ?? PaginationConstant.lowLimit;

  ListingUseCase(
    this._getPaginationData, [
    this._fetchLimit,
  ]);

  Pagination get pagination => _pagination;
  List<T> get data => _data;

  Future<List<T>> getData([P? param]) async {
    _pagination = Pagination(
      limit: fetchLimit,
    );
    _data.clear();
    return _getData(param);
  }

  Future<List<T>> loadMoreData([P? param]) {
    return _getData(param);
  }

  Future<List<T>> _getData([P? param]) async {
    final response = await _getPaginationData(
      _pagination.page,
      _pagination.limit,
      param,
    );
    _pagination = Pagination(
      page: _pagination.nextPage,
      total: _pagination.total + response.length,
    );
    _data.addAll(response);
    return response;
  }
}
