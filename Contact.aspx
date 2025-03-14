﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormVueExample.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>


    <h2>See the code in the Contact Form</h2>

    <br />

    <div id="app">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">CRUD Example</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3">
                        <label>Name</label>
                        <input type="text" class="form-control" v-model="user.firstName" placeholder="Name">
                    </div>
                    <div class="col-md-3">
                        <label>Last Name</label>
                        <input type="text" class="form-control" v-model="user.lastName" placeholder="Last Name">
                    </div>
                    <div class="col-md-3">
                        <label>email</label>
                        <input type="text" class="form-control" v-model="user.email" placeholder="email">
                    </div>
                    <div class="col-md-3">
                        <label>Role</label>
                        <input type="text" class="form-control" v-model="user.role" placeholder="Role">
                    </div>
                </div>
                <br />
                <div class="row">

                <div class="col-md-3">
                    <label for="fruit">Select an option:</label>
                    <select id="fruit" v-model="selectedFruit">
                      <option v-for="fruit in fruits" :key="fruit.id" :value="fruit.id">
                        {{ fruit.label }}
                      </option>
                    </select>
                    <p>Selected: {{ selectedFruit }}</p>
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-default" @click ="resetUser" onclick='return false;'>Clear</button>&nbsp;
                        <button type="submit" class="btn btn-primary" @click ="addUser" onclick='return false;' >Submit</button> 
                    </div>
                </div>
                <br />
                             
                <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>DataSourceSelection</th>
                                <th>combobox Based on selection</th>
                                 <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr v-for="item in users" :key="item.id">
                          <td>{{item.firstName}} {{item.lastName}}</td>
                            <td>{{item.email}}</td>
                            <td>{{item.role}}</td>
                            <td>

                             <label for="datasource">Select an option:</label>
                                <select id="datasource" v-model="item.datasource">
                                  <option v-for="option in dataSourceSelection" :key="option.id" :value="option.id">
                                    {{ option.label }}
                                  </option>
                                </select>
                                <p>Selected: {{ item.datasource }}</p>
                            </td>
                            <td>                    
            
                                <label for="dynamicDataSouruce">Select an option:</label>
                                <select id="dynamicDataSouruce" v-model="item.dynamicId">
                                  <option v-for="option in item.datasource == 1 ? fruits: cars" :key="option.id" :value="option.id">
                                    {{ option.label }}
                                  </option>
                                </select>
                                <p>Selected: {{ item.dynamicId }}</p>
               
                            </td>
                            <td><span class="glyphicon glyphicon-pencil" aria-hidden="true"  @click ="gridEditEvent(item)"></span>&nbsp;
                                <span class="glyphicon glyphicon-remove" aria-hidden="true" @click ="gridDeleteEvent(item)"></span>
                            </td>
                        </tr>
                        </tbody>
               </table>
              
            </div>

        </div>

    </div>

    <div id="companyApp">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">CRUD Example 2</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3">
                        <label>Company Name</label>
                        <input type="text" class="form-control" v-model="company.companyName" placeholder="Company Name">
                    </div>
                    <div class="col-md-3">
                        <label>Company Location</label>
                        <input type="text" class="form-control" v-model="company.location" placeholder="Company Location">
                    </div>
                </div>
                <br />
                <div class="row">
                     <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-default" @click ="methodsAPI.resetCompany" onclick='return false;'>Clear</button>&nbsp;
                        <button type="submit" class="btn btn-primary" @click ="methodsAPI.addCompany" onclick='return false;' >Submit</button> 
                    </div>
                </div>
                <br />


            </div>

        </div>

    </div>

    <script>
        const { createApp, ref, reactive, onMounted, watch } = Vue;
    </script>

    <script>

        const app = createApp({
            setup() {

                //#region Example reactivity (Models/properties)
                const user = reactive({
                    firstName: '',
                    lastName: '',
                    email: '',
                    role: '',
                    dynamicId: '',
                    datasource:''
                });
                const users = reactive([]);
                //#endregion

                //#region Methods
                const addUser = () => {
                    users.push({
                        firstName: user.firstName,
                        lastName: user.lastName,
                        email: user.email,
                        role: user.role,
                        dynamicId: selectedFruit,
                        datasource: ""
                    })
                    resetUser();
                };

                const resetUser = () => {
                    user.firstName = "";
                    user.lastName = "";
                    user.email = "";
                    user.role = "";
                    user.dynamicId = "";
                    user.datasource = "";
                }

                const getEmployees = () => {
                    $.ajax({
                        method: "POST",
                        url: "Contact.aspx/GetEmpList",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (response) {
                            response.d.forEach((element) => {
                                users.push({
                                    firstName: element.firstName,
                                    lastName: element.lastName,
                                    email: element.email,
                                    role: element.role,
                                })
                            });
                        },
                        failure: function (response) {
                            console.log("Failure")
                            alert(response.d);
                        }
                    });
                }

                const gridEditEvent = (object) => {
                    // Redirect to another page or call a Modal for Editing Purposes
                    alert(JSON.stringify(object, null, 4));
                }


                const gridDeleteEvent = (object) => {
                    const objWithIdIndex = users.findIndex((obj) => obj.firstName === object.firstName);
                    if (objWithIdIndex > -1) {
                        users.splice(objWithIdIndex, 1);
                    }
                }
                //#endregion

                // New Added
                const fruits = ref([
                    { id: 1, value: "apple", label: "Apple" },
                    { id: 2, value: "banana", label: "Banana" },
                    { id: 3, value: "cherry", label: "Cherry" },
                ]);

                const selectedFruit = ref("");

                const cars = ref([
                    { id: 1, value: "Toyota", label: "Toyota" },
                    { id: 2, value: "Honda", label: "Honda" },
                    { id: 3, value: "Hyunday", label: "Hyunday" },
                ]);

                const selectedCar = ref("");

                const dataSourceSelection = ref([
                    { id: 1, value: "Fruits", label: "Fruits" },
                    { id: 2, value: "Cars", label: "Cars" }
                ]);

                const selectedDataSource = ref("");

                const comboBoxDataSource = ref([]);


                //#region life Cycle Hooks

                onMounted(() => {
                    getEmployees();
                    //FILL DATASOURCE1
                    //FILL DATASOURCE2
                });

                //#endregion

                return {
                    user,
                    users,
                    addUser,
                    resetUser,
                    getEmployees,
                    gridEditEvent,
                    gridDeleteEvent,
                    fruits, selectedFruit, cars, selectedCar, dataSourceSelection, selectedDataSource, comboBoxDataSource  // Added
                }
            }
        });
        app.mount("#app");

    </script>

    <script>

        const companyApp = createApp({
            setup() {

                //#region Example reactivity (Models/properties)
                const company = reactive({
                    companyName: '',
                    location: '',
                });
                //#endregion

                //#region Methods 
                const addCompany = () => {

                    $.ajax({
                        method: "POST",
                        url: "Contact.aspx/InsertCompany",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        data: JSON.stringify({ company: company }),
                        success: function (response) {
                            if (response.d.requestStatus == 200) { // 200 means a good request
                                console.log("Post Response Status:", response.d.requestStatus)
                                console.log("Inserted Data", response.d.data)
                                //Load Information
                                getCompany();
                                alert("Success!")
                            } else {
                                //Trigger Notification Alert (Bad Request)
                                console.log("Post Response Status:", response.d.data)
                                alert(response.d.data);
                            }
                        },
                        failure: function (response) {
                            console.log("Failure")
                            alert(response.d);
                        }
                    });

                };

                const resetCompany = () => {
                    company.companyName = "";
                    company.location = "";
                }

                const getCompany = () => {
                    $.ajax({
                        method: "POST",
                        url: "Contact.aspx/GetCompany",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (response) {
                            company.companyName = response.d.companyName;
                            company.location = response.d.location;
                        },
                        failure: function (response) {
                            console.log("Failure")
                            alert(response.d);
                        }
                    });
                }

                //#endregion

                //#region life Cycle Hooks

                console.log("setup");
                getCompany(); // Similar to option API Create life Cycle Hook

                onMounted(() => {
                    console.log("onMounted");
                    //getCompany();
                });

                //#endregion

                // Group of methods
                const methodsAPI = {
                    resetCompany,
                    getCompany,
                    addCompany
                }

                return {
                    company,
                    methodsAPI
                }
            }
        });
        companyApp.mount("#companyApp");

    </script>

</asp:Content>
