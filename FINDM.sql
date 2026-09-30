/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      FINANCIAL STAR SCHEMA
 *
 * Date Created : Wednesday, September 30, 2026 11:14:30
 * Target DBMS : Microsoft Azure Synapse Analytics
 */

/* 
 * TABLE: dim_account 
 */

CREATE TABLE dim_account(
    account_id              int             NOT NULL,
    account_code            varchar(20)     NOT NULL,
    account_name            varchar(100)    NOT NULL,
    account_type            varchar(30)     NOT NULL,
    is_active               bit             NOT NULL,
    effective_start_date    date            NOT NULL,
    effective_end_date      date            NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (account_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_account') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_account >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_account >>>'
go

/* 
 * TABLE: dim_currency 
 */

CREATE TABLE dim_currency(
    currency_id        int            NOT NULL,
    currency_code      char(3)        NOT NULL,
    currency_name      varchar(50)    NOT NULL,
    currency_symbol    varchar(5)     NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (currency_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_currency') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_currency >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_currency >>>'
go

/* 
 * TABLE: dim_date 
 */

CREATE TABLE dim_date(
    date_id             int            NOT NULL,
    full_date           date           NOT NULL,
    year_num            int            NOT NULL,
    quarter_name        varchar(6)     NOT NULL,
    month_num           int            NOT NULL,
    month_name          varchar(20)    NOT NULL,
    day_of_week_num     int            NOT NULL,
    day_name            varchar(20)    NOT NULL,
    week_of_year_num    int            NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (date_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_date') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_date >>>'
go

/* 
 * TABLE: dim_department 
 */

CREATE TABLE dim_department(
    department_id           int             NOT NULL,
    [Parent Department ID]  int             NULL,
    department_code         varchar(20)     NOT NULL,
    department_name         varchar(100)    NOT NULL,
    department_level        int             NULL,
    is_active               bit             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (department_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_department') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_department >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_department >>>'
go

/* 
 * TABLE: dim_department_1 
 */

CREATE TABLE dim_department_1(
    department_id           int             NOT NULL,
    [Parent Department ID]  int             NULL,
    department_code         varchar(20)     NOT NULL,
    department_name         varchar(100)    NOT NULL,
    department_level        int             NULL,
    is_active               bit             NOT NULL,
    CONSTRAINT PK3_1 PRIMARY KEY NONCLUSTERED (department_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_department_1') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_department_1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_department_1 >>>'
go

/* 
 * TABLE: dim_scenario 
 */

CREATE TABLE dim_scenario(
    scenario_id       int            NOT NULL,
    scenario_code     varchar(20)    NOT NULL,
    scenario_name     varchar(50)    NOT NULL,
    version_number    int            NULL,
    is_active         bit            NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (scenario_id) NOT ENFORCED
)

go


IF OBJECT_ID('dim_scenario') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_scenario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_scenario >>>'
go

/* 
 * TABLE: fact_financial 
 */

CREATE TABLE fact_financial(
    fact_financial_id    int               NOT NULL,
    revenue_amount       decimal(18, 2)    NOT NULL,
    expense_amount       decimal(18, 2)    NOT NULL,
    profit_amount        decimal(18, 2)    NOT NULL,
    quantity             decimal(18, 2)    NULL,
    document_number      varchar(50)       NULL,
    load_timestamp       datetime          NOT NULL,
    account_id           int               NOT NULL,
    department_id        int               NOT NULL,
    date_id              int               NOT NULL,
    scenario_id          int               NOT NULL,
    currency_id          int               NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (fact_financial_id) NOT ENFORCED
)

go


IF OBJECT_ID('fact_financial') IS NOT NULL
    PRINT '<<< CREATED TABLE fact_financial >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE fact_financial >>>'
go

