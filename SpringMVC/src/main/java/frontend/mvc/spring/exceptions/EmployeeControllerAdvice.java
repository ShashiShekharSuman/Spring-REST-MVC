package frontend.mvc.spring.exceptions;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@ControllerAdvice
public class EmployeeControllerAdvice {

    @ExceptionHandler(HttpClientErrorException.class)
    public ModelAndView httpClientErrorExceptionHandler(HttpClientErrorException httpClientErrorException) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<HashMap<String, Object>> typeRef = new TypeReference<>() {};

        HashMap<String,Object> fieldErrors = mapper.readValue(httpClientErrorException.getResponseBodyAsString(), typeRef);
        return new ModelAndView("EmployeeForm", fieldErrors);
    }
}
