enum StatusCode {
  ok(200),
  created(201),
  accepted(202),
  noContent(204),

  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  conflict(409),
  unprocessableEntity(422),

  internalServerError(500),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504);

  final int code;

  const StatusCode(this.code);

  bool get isSuccess => code >= 200 && code < 300;

  static StatusCode? fromCode(int? code) {
    if (code == null) {
      return null;
    }

    for (final status in StatusCode.values) {
      if (status.code == code) {
        return status;
      }
    }

    return null;
  }
}