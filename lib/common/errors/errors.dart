class Errors {

  String setError(String error){
    if(error == 'ERROR_INVALID_EMAIL'){
      return 'Email inválido';
    } else if(error == 'ERROR_WRONG_PASSWORD'){
      return 'Senha incorreta';
    } else if(error == 'ERROR_USER_NOT_FOUND'){
      return 'Usuário não encontrado';
    } else if(error == 'ERROR_USER_DISABLED'){
      return 'Usuário desabilitado';
    } else if(error == 'ERROR_TOO_MANY_REQUESTS'){
      return 'Espere um pouco para tentar novamente';
    } else if(error == 'ERROR_OPERATION_NOT_ALLOWED'){
      return 'O login foi desabilitado';
    } else{
      return 'Verifique sua conexão com a internet';
    }
  }

}