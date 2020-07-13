class ErrorsFire {

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
    } else if(error == 'ERROR_WEAK_PASSWORD'){
      return 'Senha muito fraca';
    } else if(error == 'ERROR_EMAIL_ALREADY_IN_USE'){
      return 'Este email já está em uso';
    } else{
      return 'Verifique sua conexão com a internet';
    }
  }

}