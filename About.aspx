<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>


<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebFormVueExample.About"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

    <h2>See the code in the About Form</h2>
    <br />


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
                            <label>v-for Example:</label>
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
<%--                        <select v-model="dropDownSelectedItem" class="form-control">
                            <option value="1">Gerald</option>
                            <option value="2">Edwin</option>
                            <option value="3">Kelvin</option>
                        </select>--%>

                        <asp:DropDownList ID="nameDropDownList" class="form-control"
                            AutoPostBack="false"
                            v-model="dropDownSelectedItem"
                            runat="server" >
                            <asp:ListItem Value="1"> Gerald </asp:ListItem>
                            <asp:ListItem Value="2"> Edwin </asp:ListItem>
                            <asp:ListItem Value="3"> Kelvin </asp:ListItem>
                        </asp:DropDownList>

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
                        <b>Watch Example: Will trigger an alert when Selected Value is 3: Kelvin</b>
                        <div v-show="triggerAlertIfDropDownSelectionIsKelvin" class="alert alert-success" role="alert">Hello Kelvin!! example: v-show directive with computed property</div>
                    </div>
                </div>

            </div>

        </div>
    </div>

     <%-- App 2 --%>

    <div id="app2">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Application 2 - Example Share Reactive Data Between Vue Apps</h3>
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

    <%-- Example Ajax Call: We can make Ajax calls in a easy way. Also, we can use Axios for Ajax calls. DVG 02-26-23 --%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Application 3 - Example Ajax Calls with WebMethod</h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-md-6">
                    <div>
                        Your Name :
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        <input id="btnGetTime" type="button" value="Show Current Time"
                            onclick="ShowCurrentTime()" />
                    </div>
                </div>

            </div>

        </div>

    </div>



    <script>
        //Vue Initialization
        const { createApp, ref, computed, reactive, watch } = Vue;
        // Ref Attribute for reactivity and shared data between vue apps
        const sharedVariable = ref('');

    </script>

    <%-- APP 1 --%>
    <script>

        //Things to Add: 
        // 1 - Try to create a main and also childs components.
        // 2 - Example of partial views


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

                //#region Example Computed
                const dropDownSelectionComputedExample = computed(() => {
                    return dropDownSelectedItem.value == '1' ? 'Gerald' : dropDownSelectedItem.value == '2' ? 'Edwin' : dropDownSelectedItem.value == '3' ? 'Kelvin' : null;
                })

                const triggerAlertIfDropDownSelectionIsKelvin = computed(() => {
                    return dropDownSelectedItem.value === '3'
                });


                //#endregion

                //#region Example Watch
                watch(dropDownSelectedItem, async (newDropDownSelectedItem, oldSDropDownSelectedItem) => {
                    if (newDropDownSelectedItem === "3")
                        alert("Watch Example: The selected Item was Kelvin!")

                })
                //#endregion
                                
                return {
                    user,
                    users,
                    dropDownSelectedItem,
                    sharedVariable,
                    addUser,
                    clearUsersList,
                    resetUser,
                    dropDownSelectionComputedExample,
                    triggerAlertIfDropDownSelectionIsKelvin
                }
            }
        });
        app.mount("#app");


    </script>

     <%-- APP 2 --%>
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

    <%-- Example Ajax Call --%>
    <script type="text/javascript">
        function ShowCurrentTime() {
            console.log("Me Dispare")
            var obj = { name: "Dennis" };
            var param = JSON.stringify(obj);
            $.ajax({
                method: "POST",
                url: "About.aspx/GetCurrentTime",
                data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   async: true,
                   cache: false,
                   success: OnSuccess,
                   failure: function (response) {
                       console.log("Failure")
                       alert(response.d);
                   }
               });
        };

        function OnSuccess(response) {
            console.log("Success")
            alert(response.d);
        };
    </script>


</asp:Content>
