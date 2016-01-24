/*
 * ActionType
 *
 * Version 1
 */
package com.carrental.content.actions;

/**
 * Makes instance of command/action
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public enum ActionType {
    INIT {
        {
            this.action = new InitAction();
        }
    },
    HOME {
        {
            this.action = new HomeAction();
        }
    },
    LOGIN {
        {
            this.action = new LoginAction();
        }
    },
    LOGOUT {
        {
            this.action = new LogoutAction();
        }
    },
    LANG {
        {
            this.action = new ChangeLangAction();
        }
    },
    REGISTER {
        {
            this.action = new RegisterAction();
        }
    },
    SEARCH {
        {
            this.action = new SearchAction();
        }
    },
    RENT {
        {
            this.action = new RentAction();
        }
    },
    USERCABINET {
        {
            this.action = new UserCabinetAction();
        }
    },
    USERINFO {
        {
            this.action = new UserInfoAction();
        }
    },
    SEARCHORDER {
        {
            this.action = new SearchOrderAction();
        }
    },
    VIEWORDER {
        {
            this.action = new ViewOrderAction();
        }
    },
    APPLICATIONS {
        {
            this.action = new ViewApplicationsAction();
        }
    }, 
    PAYMENTS {
        {
            this.action = new ViewPaymentsAction();
        }
    };
    
    Action action;
    
    public Action getActionType() {
        return action;
    }
}
