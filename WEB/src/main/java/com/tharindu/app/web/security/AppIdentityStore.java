package com.tharindu.app.web.security;

import com.tharindu.app.core.model.User;
import com.tharindu.app.core.service.UserService;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.security.enterprise.credential.Credential;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;
import jakarta.security.enterprise.identitystore.IdentityStore;

import java.util.Set;

@ApplicationScoped
public class AppIdentityStore implements IdentityStore {
    @EJB
    private UserService userService;

    @Override
    public CredentialValidationResult validate(Credential credential) {
        if (credential instanceof UsernamePasswordCredential) {
            UsernamePasswordCredential USER_PASS_CREDENTIALS = (UsernamePasswordCredential) credential;

            if (userService.validate(USER_PASS_CREDENTIALS.getCaller(), USER_PASS_CREDENTIALS.getPasswordAsString())) {
                User user = userService.getUserByEmail(USER_PASS_CREDENTIALS.getCaller());

                return new CredentialValidationResult(user.getEmail(), Set.of(user.getUserType().name()));
            }
        }
        return CredentialValidationResult.INVALID_RESULT;
    }
}
