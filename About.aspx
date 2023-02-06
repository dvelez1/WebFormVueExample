<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebFormVueExample.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2><%: Title %>.</h2>
    <p>Your app description page.</p>
    <p>Use this area to provide additional information. C#</p>
    <hr />
    <%-- App 1 --%>
    <div id="app">
        <form>
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
            <br />Shared Variable: {{sharedVariable}}
        </form>
        <br /> <br />
        <div class="row">
            <div class="col-md-6">
                 <label>Nombre mientras escribo:</label> {{user.name + ' ' + user.lastName}}
            </div>
            <div class="col-md-6">
                <label>Push:</label>
                <li v-for="item in users">
                    {{ item }}
                </li>
            </div>
        </div>

    </div>
    <br />
    <hr />
        <div id="app2">
        <form>
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
             <br />Shared Variable: {{sharedVariable}}
        </form>
        <br /> <br />
        <div class="row">
            <div class="col-md-6">
                 <label>Nombre mientras escribo:</label> {{user.name + ' ' + user.lastName}}
            </div>
            <div class="col-md-6">
                <label>Push:</label>
                <li v-for="item in users">
                    {{ item }}
                </li>
            </div>
        </div>

    </div>

    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>


<%--    <script>
        const { createApp } = Vue

        createApp({
            data() {
                return {
                    message: 'Hello Vue!'
                }
            }
        }).mount('#app')
    </script>--%>

        <script>
            const { createApp, ref, computed, reactive } = Vue;

            const sharedVariable = ref('Hello Vue!');

            const app = createApp({
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
            app.mount("#app");


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
</asp:Content>
