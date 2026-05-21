@extends('layouts.app')

@section('title', 'Add New Personnel')

@section('content')

<div class="container-fluid">

    <h3 class="mb-4">Add New Personnel</h3>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <form action="/personnel" method="POST">
        @csrf

        <!-- ================= PERSONAL INFORMATION ================= -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                Personal Information
            </div>

            <div class="card-body">
                <div class="row g-3">

                    <div class="col-md-4">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="personnel_last_name" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">First Name</label>
                        <input type="text" name="personnel_first_name" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Middle Name</label>
                        <input type="text" name="personnel_middle_name" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Sex</label>
                        <select name="sex_id_personnel_fk" class="form-select">
                            <option value="">Select Sex</option>
                            @foreach($sexes as $sex)
                                <option value="{{ $sex->sex_id }}">{{ $sex->sex_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Civil Status</label>
                        <select name="civil_status_id_personnel_fk" class="form-select">
                            <option value="">Select Civil Status</option>
                            @foreach($civilStatuses as $status)
                                <option value="{{ $status->civil_status_id }}">
                                    {{ $status->civil_status_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Birth Date</label>
                        <input type="date" name="personnel_birthdate" class="form-control">
                    </div>

                </div>
            </div>
        </div>

        <!-- ================= PLACE OF BIRTH ================= -->
        <div class="card mb-4">
            <div class="card-header bg-secondary text-white">
                Place of Birth
            </div>

            <div class="card-body">
                <div class="row g-3">

                    <div class="col-md-4">
                        <label class="form-label">Region</label>
                        <select id="birth_place_region" class="form-select">
                            <option value="">Select Region</option>
                            @foreach($regions as $region)
                                <option value="{{ $region->region_id }}">
                                    {{ $region->region_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Province</label>
                        <select id="birth_place_province" class="form-select">
                            <option value="">Select Province</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Municipality</label>
                        <select id="birth_place_municipality" name="birth_place" class="form-select">
                            <option value="">Select Municipality</option>
                        </select>
                    </div>

                </div>
            </div>
        </div>

        <!-- ================= ADDRESS SECTION ================= -->
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                Permanent Address
            </div>

            <div class="card-body">
                <div class="row g-3">

                    <div class="col-md-3">
                        <label class="form-label">Region</label>
                        <select id="permanent_address_region" class="form-select">
                            <option value="">Select Region</option>
                            @foreach($regions as $region)
                                <option value="{{ $region->region_id }}">{{ $region->region_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Province</label>
                        <select id="permanent_address_province" class="form-select"></select>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Municipality</label>
                        <select id="permanent_address_municipality" class="form-select"></select>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Barangay</label>
                        <select name="permanent_address_barangay_id" id="permanent_address_barangay" class="form-select"></select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Street</label>
                        <input type="text" name="permanent_address_street" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Subdivision/Village</label>
                        <input type="text" name="permanent_address_subdivision_village" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">House/Lot No.</label>
                        <input type="text" name="permanent_address_house_block_lot_no" class="form-control">
                    </div>

                </div>
            </div>
        </div>
        <div class="card mb-4">
    <div class="card-header bg-warning text-dark">
        Present Address
    </div>

    <div class="card-body">
        <div class="row g-3">

            <div class="col-md-3">
                <label class="form-label">Region</label>
                <select id="present_address_region" class="form-select">
                    <option value="">Select Region</option>
                    @foreach($regions as $region)
                        <option value="{{ $region->region_id }}">
                            {{ $region->region_name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Province</label>
                <select id="present_address_province" class="form-select"></select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Municipality</label>
                <select id="present_address_municipality" class="form-select"></select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Barangay</label>
                <select name="present_address_barangay_id" id="present_address_barangay" class="form-select"></select>
            </div>

            <div class="col-md-4">
                <label class="form-label">Street</label>
                <input type="text" name="present_address_street" class="form-control">
            </div>

            <div class="col-md-4">
                <label class="form-label">Subdivision/Village</label>
                <input type="text" name="present_address_subdivision_village" class="form-control">
            </div>

            <div class="col-md-4">
                <label class="form-label">House/Lot No.</label>
                <input type="text" name="present_address_house_block_lot_no" class="form-control">
            </div>

        </div>
    </div>
    </div>

        <!-- ================= IDS ================= -->
        <div class="card mb-4">
            <div class="card-header bg-info text-white">
                Government IDs
            </div>

            <div class="card-body">
                <div class="row g-3">

                    <div class="col-md-4">
                        <input type="text" name="umid_id_no" class="form-control" placeholder="UMID ID No.">
                    </div>

                    <div class="col-md-4">
                        <input type="text" name="pag_ibig_no" class="form-control" placeholder="Pag-IBIG No.">
                    </div>

                    <div class="col-md-4">
                        <input type="text" name="phil_health_no" class="form-control" placeholder="PhilHealth No.">
                    </div>

                    <div class="col-md-4">
                        <input type="text" name="phil_sys_no" class="form-control" placeholder="PhilSys No.">
                    </div>

                    <div class="col-md-4">
                        <input type="text" name="tin_no" class="form-control" placeholder="TIN No.">
                    </div>

                </div>
            </div>
        </div>

        <!-- ================= EMPLOYMENT ================= -->
        <div class="card mb-4">
            <div class="card-header bg-success text-white">
                Employment Information
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label class="form-label">Employee Number</label>
                        <input type="text" name="employee_no" class="form-control">
                    </div>
                </div>
            </div>
        </div>

        <!-- SUBMIT -->
        <div class="text-end">
            <button type="submit" class="btn btn-primary px-5">
                Save Personnel
            </button>
        </div>

    </form>
</div>

@endsection