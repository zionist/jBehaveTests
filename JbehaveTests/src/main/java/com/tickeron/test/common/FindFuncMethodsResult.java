package com.tickeron.test.common;

import java.util.Set;

/**
 * Created by slaviann on 16.03.16.
 */
public class FindFuncMethodsResult {
    private String module;
    private Set<String> methods;

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public Set<String> getMethods() {
        return methods;
    }

    public void setMethods(Set<String> methods) {
        this.methods = methods;
    }
}
