<!-- SIDEBAR -->
<div class="sidebar">

    <div>

        <!-- LOGO / TITLE -->
        <div class="logo">
            SIMIS Pro: Step Increment Monitoring and Information System
        </div>

        <!-- MAIN MENU -->
        <ul class="menu">

            <li class="{{ request()->is('dashboard') ? 'active' : '' }}">
                <a href="{{ url('/dashboard') }}">
                    Dashboard
                </a>
            </li>

            <li class="{{ request()->is('personnel*') ? 'active-menu' : '' }}">
                <a href="{{ url('/personnel') }}">
                    ◫ Personnel Information Management
                </a>
            </li>

            <!-- EMPLOYMENT MANAGEMENT -->
            <li class="submenu">
                <a href="javascript:void(0)" onclick="toggleSubmenu(this)">
                    Employment Management ▾
                </a>

                <ul class="submenu-list">

                    <li>
                        <a href="{{ url('/employment/appointments') }}">
                            Appointments & Movements
                        </a>
                    </li>

                    <li>
                        <a href="{{ url('/employment/ipcrf') }}">
                            IPCRF Performance Evaluation
                        </a>
                    </li>

                </ul>
            </li>

            <li>
                <a href="{{ url('/step-increment') }}">
                    ◫ Step Increment Monitoring
                </a>
            </li>

            <li>
                <a href="{{ url('/service-gap') }}">
                    ◫ Service Gap Monitoring
                </a>
            </li>

        </ul>

    </div>

    <!-- SETTINGS -->
    <div class="settings">

        <ul class="menu">

            <li class="submenu">
                <a href="javascript:void(0)" onclick="toggleSubmenu(this)">
                    ◫◫ System Settings ▾
                </a>

                <ul class="submenu-list">

                    <li>
                        <a href="{{ url('/settings/user-roles') }}">
                            User Roles & Permissions
                        </a>
                    </li>

                    <li>
                        <a href="{{ url('/settings/users') }}">
                            User Account Management
                        </a>
                    </li>

                    <li>
                        <a href="{{ url('/settings/calendar') }}">
                            School Calendar Configuration
                        </a>
                    </li>

                    <li>
                        <a href="{{ url('/settings/salary') }}">
                            Salary Schedule Table
                        </a>
                    </li>

                    <li>
                        <a href="{{ url('/settings/service-gap') }}">
                            Service Gap Settings
                        </a>
                    </li>

                </ul>
            </li>

        </ul>

    </div>

</div>