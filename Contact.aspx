<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormVueExample.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>


    <h2>See code in Contact Form</h2>

    <br />

    <div id="app">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Example of get and post</h3>
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
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary" @click ="addUser" onclick='return false;' style="float: right">Submit</button> 
                        <button type="submit" class="btn btn-default" @click ="resetUser" onclick='return false;' style="float: right">Clear</button>
                    </div>
                </div>
                <br />
                             
                <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr v-for="item in users" :key="item.id">
                          <td>{{item.firstName}} {{item.lastName}}</td>
                            <td>{{item.email}}</td>
                            <td>{{item.role}}</td>
                        </tr>
                        </tbody>
               </table>
              
            </div>

        </div>

    </div>


    <script>

        const { createApp, ref, reactive, onMounted, onBeforeMount } = Vue;


        const app = createApp({
            setup() {

                //#region Example reactivity (Models/properties)
                const user = reactive({
                    firstName: '',
                    lastName: '',
                    email: '',
                    role: ''
                });

                const users = reactive([
                    { firstName: 'Frank', lastName: 'Murphy', email: 'frank.murphy@test.com', role: 'User' },
                    { firstName: 'Vic', lastName: 'Reynolds', email: 'vic.reynolds@test.com', role: 'Admin' },
                    { firstName: 'Gina', lastName: 'Jabowski', email: 'gina.jabowski@test.com', role: 'Admin' },
                    { firstName: 'Jessi', lastName: 'Glaser', email: 'jessi.glaser@test.com', role: 'User' },
                    { firstName: 'Jay', lastName: 'Bilzerian', email: 'jay.bilzerian@test.com', role: 'User' }
                ]);

                //#endregion

                //#region lyfe Cycle Hooks

                onBeforeMount(() => {
                    //
                });

                onMounted(() => {
                    //
                });

                //#endregion

                //#region Methods
                const addUser = () => {
                    users.push({
                        firstName: user.firstName,
                        lastName:user.lastName,
                        email:user.email ,
                        role:user.role, 
                    })
                    resetUser();
                };

                const resetUser = () => {
                    user.firstName = "";
                    user.lastName = "";
                    user.email = "";
                    user.role = "";
                }

                //#endregion
                

                return {
                    user,
                    users,
                    addUser,
                    resetUser,
                }
            }
        });
        app.mount("#app");


    </script>

</asp:Content>
