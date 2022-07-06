using {mycapservice.schema as my} from '../db/schema';

service EmployeeService @(path : 'browse') {

    entity EmployeeMaster     as
        select from my.EmployeeMaster {
            *,
            null as gender_Text : String
        };

    entity EmployeeExperience as
        select from my.EmployeeExperience {
            *
        };

    entity EmployeeEduction   as
        select from my.EmployeeEduction {
            *
        };

    entity EmployeeAddress    as
        select from my.EmployeeAddress {
            *
        };

    entity EmployeeLeaves     as
        select from my.EmployeeLeaves {
            *
        };

    entity Assets             as
        select from my.Assets {
            *
        };

    entity GenderVH           as
        select from my.GenderVH {
            *
        };


    annotate EmployeeMaster with @(
        title : 'Employee master entity',
        UI    : {
            LineItem        : [
                {Value : employeeActive},
                {Value : firstName},
                {Value : lastname},
                {Value : age},
                {Value : gender},
                {Value : dateOfBirth},
                {Value : Email},
                {Value : mobile},
                {Value : employeeType},
                {Value : employeeActive},
                {Value : marriedStatus},
                {Value : departmentCode},
                {Value : createdAt}
            ],
            SelectionFields : [
                employeeCode,
                firstName,
                lastname,
                employeeType,
                departmentCode,
                employeeActive,
                marriedStatus,
                gender,
                Email,
                dateOfBirth,
                mobile
            ],
            HeaderInfo      : {
                $Type          : 'UI.HeaderInfoType',
                TypeName       : 'Employee Master',
                TypeNamePlural : 'Employee Master',
                Title          : {
                    $Type : 'UI.DataField',
                    Value : firstName
                }
            }
        }
    ) {
        employeeCode          @(title : 'Employee Code');
        firstName             @(title : 'First Name');
        lastname              @(title : 'Last Name');
        employeeActive        @(title : 'Employee Active');
        employeeType          @(title : 'Employee Type');
        mobile                @(title : 'Mobile No');
        Email                 @(title : 'Email');
        marriedStatus         @(title : 'Marital Status');
        dateOfBirth           @(title : 'Date Of Birth');
        departmentCode        @(title : 'Department Code');
        age                   @(title : 'Age');
        departmentDescription @(title : 'Department Description');
        departmentName        @(title : 'Department Name');
        nationality           @(title : 'Nationality');
        gender                @(
            sap    : {label : 'Gender'},
            Common : {
                Label                    : 'Gender',
                Text                     : gender_Text,
                TextArrangement          : #TextLast,
                ValueListWithFixedValues : false,
                ValueList                : {
                    $Type           : 'Common.ValueListType',
                    Label           : 'Gender Value Help',
                    CollectionPath  : 'GenderVH',
                    SearchSupported : true,
                    Parameters      : [

                        {
                            $Type             : 'Common.ValueListParameterOut',
                            LocalDataProperty : 'gender', // Actual Entity Property Ex: EmployeeMaster M
                            ValueListProperty : 'ID' //VH Property Ex: GenderVH M
                        },
                        {
                            $Type             : 'Common.ValueListParameterDisplayOnly',
                            ValueListProperty : 'genderText'
                        }
                    ]
                }
            }
        )
    };

    annotate GenderVH with @(title : 'Gender VH Entity') {
        ID         @(Common : {
            Label           : 'ID',
            Text            : genderText,
            TextArrangement : #TextSeparate
        });
        genderText @(Common : {Label : 'Gender'});
    };


}
