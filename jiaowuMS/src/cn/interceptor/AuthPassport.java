package cn.interceptor;

import java.lang.annotation.Documented;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import static java.lang.annotation.ElementType.*;

import java.lang.annotation.Target;

@Documented
@Inherited
@Target(value={METHOD, TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
	String validate() default "";
}
