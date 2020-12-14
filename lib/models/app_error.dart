class AppError implements Exception{
  String message;

  @override
  String toString() {
    return message;
  }
}

class AppRepositoryError extends AppError {
  AppRepositoryError(String message){
    this.message = message;
  }
}