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
        Capabilities.Deletable,
        Capabilities.Insertable,
        Capabilities.Updatable,
        fiori.draft.enabled,
        title : 'Employee master entity',
        UI    : {
            LineItem                   : [
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
            SelectionFields            : [
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
            HeaderInfo                 : {
                $Type          : 'UI.HeaderInfoType',
                TypeName       : 'Employee Master',
                TypeNamePlural : 'Employee Master',
                Title          : {
                    $Type : 'UI.DataField',
                    Value : firstName
                },
                Description: {
                    $Type : 'UI.DataField',
                    Value : employeeCode
                }
            },

            HeaderFacets               : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'Date Of Birth',
                    ID     : 'DOB',
                    Target : '@UI.DataPoint#DateOfBirth'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'AGE',
                    Target : '@UI.DataPoint#AgeProgress'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'EMP_TYPE',
                    Target : '@UI.DataPoint#EmployeeType'
                }
            ],

            DataPoint #DateOfBirth     : {
                $Type : 'UI.DataPointType',
                Value : dateOfBirth,
                Title : 'Date Of Birth'
            },

            DataPoint #AgeProgress     : {
                Title         : 'Employee Age Info',
                Description   : 'Years',
                Value         : age,
                TargetValue   : 100,
                Criticality   : #Neutral,
                Visualization : #Progress
            },

            DataPoint #EmployeeType : {
                Value : employeeType,
                Title : 'Employment Type',
                Criticality : #Positive
            },

            Facets                     : [{
                $Type  : 'UI.CollectionFacet',
                Label  : 'Basic Information',
                ID     : 'BASICDATA',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Target : '@UI.FieldGroup#GeneralData',
                        Label  : 'General Data',
                        ID     : 'GENERAL_DATA',
                    },
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Target : '@UI.FieldGroup#DepartmentData',
                        Label  : 'Department Data',
                        ID     : 'DEPARTMENT_DATA',
                    },
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Target : '@UI.FieldGroup#AdminData',
                        Label  : 'Admin Data',
                        ID     : 'ADMIN_DATA',
                    }
                ],
            }],
            FieldGroup #GeneralData    : {
                $Type : 'UI.FieldGroupType',
                Data  : [
                    {
                        $Type : 'UI.DataField',
                        Value : employeeCode
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : firstName
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : lastname
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : age
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : gender
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : mobile
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : Email
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : dateOfBirth
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : employeeType
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : employeeActive
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : marriedStatus
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : nationality
                    }
                ]
            },

            FieldGroup #DepartmentData : {
                $Type : 'UI.FieldGroupType',
                Data  : [
                    {
                        $Type : 'UI.DataField',
                        Value : departmentCode
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : departmentDescription
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : departmentName
                    }
                ]
            },

            FieldGroup #AdminData      : {
                $Type : 'UI.FieldGroupType',
                Data  : [
                    {
                        $Type : 'UI.DataField',
                        Value : createdAt
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : createdBy
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : modifiedAt
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : modifiedBy
                    }
                ]
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
