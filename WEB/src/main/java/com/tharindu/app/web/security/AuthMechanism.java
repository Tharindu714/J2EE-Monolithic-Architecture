package com.tharindu.app.web.security;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.security.enterprise.AuthenticationException;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.authentication.mechanism.http.AutoApplySession;
import jakarta.security.enterprise.authentication.mechanism.http.HttpAuthenticationMechanism;
import jakarta.security.enterprise.authentication.mechanism.http.HttpMessageContext;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@AutoApplySession
@ApplicationScoped
public class AuthMechanism implements HttpAuthenticationMechanism {

    @Inject
    private AppIdentityStore identityStore;

    @Override
    public AuthenticationStatus validateRequest(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpMessageContext context) throws AuthenticationException {
        AuthenticationParameters AUTH_PARAMS = context.getAuthParameters();
        if (AUTH_PARAMS.getCredential() != null) {
            CredentialValidationResult CVR = identityStore.validate(AUTH_PARAMS.getCredential());
            if (CVR.getStatus() == CredentialValidationResult.Status.VALID) {
                return context.notifyContainerAboutLogin(CVR);
            }else{
                return AuthenticationStatus.SEND_FAILURE;
            }
        }
        if (context.isProtected() && context.getCallerPrincipal() == null) {
            try{
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }catch (IOException e){
                throw new RuntimeException("Failed to redirect to login page", e);
            }
        }
        return context.doNothing();
    }

    @Override
    public AuthenticationStatus secureResponse(HttpServletRequest request, HttpServletResponse response, HttpMessageContext httpMessageContext) throws AuthenticationException {
        return HttpAuthenticationMechanism.super.secureResponse(request, response, httpMessageContext);
    }
}
