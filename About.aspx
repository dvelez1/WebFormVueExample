﻿<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebFormVueExample.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>

    <h2><%: Title %>.</h2>
    <p>Your app description page.</p>
    <p>Use this area to provide additional information. C#</p>
    <hr />
    <%-- App 1 --%>
    <div id="app">
        <label><b>App 1</b></label>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" v-model="user.name" placeholder="Name">
        </div>
        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" v-model="user.lastName" placeholder="Last Name">
        </div>

            <button type="submit" class="btn btn-default" @click ="addUser" onclick='return false;' >Submit</button>
            <button type="submit" class="btn btn-default" @click ="resetUser" onclick='return false;' >Clear</button>
            <button type="submit" class="btn btn-default" @click ="clearUsersList" onclick='return false;' >Remove From List</button>

        <br />
        <br />
        <div class="row">
            <div class="col-md-6">
                <label>Nombre mientras escribo:</label>
                {{user.name + ' ' + user.lastName}}
            </div>
            <div class="col-md-6">
                <label>Push:</label>
                <li v-for="item in users">{{ item }}
                </li>
            </div>
        </div>

        <br />
        <br />
        <div class="row">
            <div class="col-md-3">
                <label>Example SharedVariable:</label>
            </div>
            <div class="col-md-3">
                <input type="text" class="form-control" v-model="sharedVariable" placeholder="Input Shared Variable">
            </div>
            <div class="col-md-5">
                <b>Shared Variable between Apps:</b> {{sharedVariable}}
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-2">
                <label>DropDown:</label>
                <select v-model="dropDownSelectedItem" class="form-control">
                    <option value="1">Gerald</option>
                    <option value="2">Edwin</option>
                    <option value="3">Kelvin</option>
                </select>
            </div>
            <div class="col-md-3">
                <b>V-IF Example:
                    <label v-if="dropDownSelectedItem == '1'">Gerald</label><label v-if="dropDownSelectedItem == '2'">Edwin</label><label v-if="dropDownSelectedItem == '3'">Kelvin</label></b>
            </div>
            <div class="col-md-3">
                <b>Computed Example: {{dropDownSelectionComputedExample}}</b>
            </div>
            <div class="col-md-2">
            </div>
        </div>

    </div>
    <br />
    <hr />

    <div id="app2">
        <label><b>App 2</b></label>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" v-model="user.name" placeholder="Name">
        </div>
        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" v-model="user.lastName" placeholder="Last Name">
        </div>


            <button type="submit" class="btn btn-default" @click ="addUser" onclick='return false;' >Submit</button>
            <button type="submit" class="btn btn-default" @click ="resetUser" onclick='return false;' >Clear</button>
            <button type="submit" class="btn btn-default" @click ="clearUsersList" onclick='return false;' >Remove From List</button>


        <br />
        <br />
        <div class="row">
            <div class="col-md-6">
                <label>Nombre mientras escribo:</label>
                {{user.name + ' ' + user.lastName}} <%--Interpolation--%>
            </div>
            <div class="col-md-6">
                <label>Push:</label>
                <li v-for="item in users">{{ item }}
                </li>
            </div>
        </div>
        <br />
        <b>Shared Variable between Apps:</b> {{sharedVariable}}

    </div>

    <br />
    <br />
    <%-- app3 --%>
<%--    <div id="app3">
        <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-default" @click ="getEmployee" onclick='return false;' >GetEmployee</button>
            </div>
        </div>
    </div>


    <br />

    <div>
        Your Name :
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <input id="btnGetTime" type="button" value="Show Current Time"
            onclick="ShowCurrentTime()" />
    </div>--%>


    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

    <script>
        //const { createApp, ref, computed, reactive } = Vue;
        //const sharedVariable = ref(''); // Shared Variable
    </script>

    <script>

        const { createApp, ref, computed, reactive } = Vue;
        const sharedVariable = ref(''); // Shared Variable

        const app = createApp({
            setup() {

                //#region Example reactivity (Models/properties)
                const user = reactive({
                    name: '',
                    lastName: ''
                });
                const users = ref([]);
                const dropDownSelectedItem = ref('')
                //#endregion

                //#region Methods
                const addUser = () => {
                    users.value.push(user.name + ' ' + user.lastName);
                    resetUser();
                };

                const clearUsersList = () => {
                    users.value = [];
                };

                const resetUser = () => {
                    user.name = "";
                    user.lastName = "";
                }


                //#endregion

                //Example Computed
                const dropDownSelectionComputedExample = computed(() => {
                    return dropDownSelectedItem.value == '1' ? 'Gerald' : dropDownSelectedItem.value == '2' ? 'Edwin' : dropDownSelectedItem.value == '3' ? 'Kelvin' : null;
                })

  
                return {
                    user,
                    users,
                    dropDownSelectedItem,
                    sharedVariable,
                    addUser,
                    clearUsersList,
                    resetUser,
                    dropDownSelectionComputedExample,

                }
            }
        });
        app.mount("#app");



    </script>

    <script>

        const app2 = createApp({
            setup() {

                const user = reactive({
                    name: '',
                    lastName: ''
                });

                const users = ref([]);

                const addUser = () => {
                    users.value.push(user.name + ' ' + user.lastName);
                    resetUser();
                };

                const clearUsersList = () => {
                    users.value = [];
                };

                const resetUser = () => {
                    user.name = "";
                    user.lastName = "";
                }

                return {
                    user,
                    users,
                    addUser,
                    clearUsersList,
                    resetUser,
                    sharedVariable
                }
            }
        });
        app2.mount("#app2");

    </script>

<%--    <script type="text/javascript">
        const app3 = createApp({
            setup() {

                const employee = reactive({
                    id: '',
                    name: ''
                });



                const getEmployee = () => {
                    console.log("Me dispare")

                    var url = '<%= ResolveUrl("~/About.aspx/GetEmpl") %>'
                    axios({
                        method: 'get',
                        url: '<%= ResolveUrl("~/About.aspx/GetEmpl") %>',
                    })
                        .then(function (response) {
                            // successful request
                            console.log('Mi respuesta', response.data);
                        })
                        .catch(function (error) {
                            // handle error
                            console.error(error);
                        })


                    //$.ajax({
                    //    type: "POST", //GET
                    //    url: "About.aspx/GetEmpl",
                    //    contentType: "application/json; charset=utf-8",
                    //    dataType: "json",
                    //    success: function (response) {
                    //        console.log(response);
                    //    },
                    //    failure: function (response) {
                    //        alert(response.d);
                    //    },
                    //    error: function (response) {
                    //        alert(response.d);
                    //    }
                    //});




                };


                const clearEmployee = () => {
                    employee.id = '',
                        employee.name = ''
                }

                return {
                    employee,
                    getEmployee
                }
            }
        });
        app3.mount("#app3");
    </script>


    <script type="text/javascript">
        function ShowCurrentTime() {
            $.ajax({
                type: "POST",
                url: "About.aspx/GetCurrentTime",
                data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            }
        });
        }
        function OnSuccess(response) {
            alert(response.d);
        }
    </script>--%>
</asp:Content>
