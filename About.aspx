<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebFormVueExample.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

    <h2><%: Title %>.</h2>
    <p>Your app description page.</p>
    <p>Use this area to provide additional information. C#</p>
    <hr />



    <%-- App 1 --%>
    <div id="app">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Application 1</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" v-model="user.name" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" v-model="user.lastName" placeholder="Last Name">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label>Example: Two Way Data Binding + Interpolation:</label>
                            {{user.name + ' ' + user.lastName}}
                        </div>
                        <div>
                            <label>Push:</label>
                            <li v-for="item in users">{{ item }}
                            </li>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary" @click ="addUser" onclick='return false;' >Submit</button> &nbsp;
                        <button type="submit" class="btn btn-default" @click ="resetUser" onclick='return false;' >Clear</button> &nbsp;
                        <button type="submit" class="btn btn-default" @click ="clearUsersList" onclick='return false;' >Reset the List</button>
                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <label>Example SharedVariable:</label>
                        <input type="text" class="form-control" v-model="sharedVariable" placeholder="Input Shared Variable">
                    </div>
                    <div class="col-md-6">
                        <b>Shared Variable between Apps:</b> {{sharedVariable}}
                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="col-md-3">
                        <label>DropDown:</label>
                        <select v-model="dropDownSelectedItem" class="form-control">
                            <option value="1">Gerald</option>
                            <option value="2">Edwin</option>
                            <option value="3">Kelvin</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label>V-IF Example:</label>
                        <br />
                        <label v-if="dropDownSelectedItem == '1'">Gerald</label><label v-if="dropDownSelectedItem == '2'">Edwin</label><label v-if="dropDownSelectedItem == '3'">Kelvin</label>
                    </div>
                    <div class="col-md-3">
                        <b>Computed Example:
                            <br />
                            {{dropDownSelectionComputedExample}}</b>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>

            </div>

        </div>
    </div>


    <div id="app2">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Application 2</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-6">
                        <b>Shared Variable between Apps:</b> {{sharedVariable}}
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>

            </div>

        </div>

    </div>




    <script>
        //Vue Initialization
        const { createApp, ref, computed, reactive } = Vue;
        // Reft Attribute for ractivity (We will use as shared Variable)
        const sharedVariable = ref('');
    </script>

    <script>

        //Things to Add: 
        // 1 - Composable function for share variables,
        // 2 - Ajax Call
        // 3 - Try to create a main and also childs components.
        // 5 - Example of partial views


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

                return {
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
