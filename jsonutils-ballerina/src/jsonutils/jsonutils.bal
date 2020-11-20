// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/java;

# Provides configurations for converting XML to JSON.
#
# + attributePrefix - Attribute prefix used in the XML
# + preserveNamespaces - Instructs whether to preserve the namespaces of the XML when converting
public type XmlOptions record {
    string attributePrefix = "@";
    boolean preserveNamespaces = true;
};

# Converts an XML object to its JSON representation.
# ```ballerina
# xml xmlValue = xml `<!-- outer comment -->` + xml `<name>supun</name>`;
# json|error jsonValue = fromXML(mxlValue);
# ```
#
# + x - The XML source to be converted to JSON
# + options - The `XmlOptions` record consisting of the configurations for the conversion
# + return - The JSON representation of the given XML on success, else returns an `error`
public isolated function fromXML(xml x, XmlOptions options = {}) returns json|error = @java:Method {
    name: "fromXML",
    'class: "org.ballerinalang.stdlib.jsonutils.FromXML"
} external;


# Converts a table to its JSON representation.
# ```ballerina
# type Employee record {
#      int id;
#      string name;
#      float salary;
#      boolean permanent;
#  };
# table<Employee> tableValue = table[ { id: 1, name: "Mary",  salary: 300.5, permanent: true },
#         { id: 2, name: "John",  salary: 300.5, permanent: true }
#     ];
# json jsonValue = jsonutils:fromTable(tableValue);
# ```
#
# + tableValue - The source table to be converted to JSON
# + return - The JSON representation of the source table
public isolated function fromTable(table<record{}> tableValue) returns json {
    return externFromTable(tableValue);
}

isolated function externFromTable(table<record{}> tableValue) returns json = @java:Method {
    name: "fromTable",
    'class: "org.ballerinalang.stdlib.jsonutils.FromTable"
} external;

public isolated function fromStream(stream<record{}, error> streamValue) returns json {
    return externFromStream(streamValue);
}

isolated function externFromStream(stream<record{}, error> streamValue) returns json = @java:Method {
    name: "fromStream",
    'class: "org.ballerinalang.stdlib.jsonutils.FromStream"
} external;
