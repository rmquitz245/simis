@extends('layouts.app')

@section('title', 'Add New Appointment')

@section('content')

<div class="container-fluid">

    <h3 class="mb-4">Add New Appointment</h3>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('appointments.store') }}" method="POST">

        @csrf

        <!-- ================= BASIC APPOINTMENT INFO ================= -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                Appointment Information
            </div>

            <div class="card-body">
                <div class="row g-3">

                    <!-- Personnel -->
                    <div class="col-md-6">
                        <label class="form-label">Personnel</label>
                        <small class="text-muted">
                            Only personnel without active appointment are shown.
                        </small>
                        @if($personnels->count() == 0)
                            <div class="alert alert-warning">
                                All personnel already have active appointments.
                            </div>
                        @endif
                        <select name="personnel_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Personnel</option>
                            @forelse($personnels as $personnel)
                                <option value="{{ $personnel->personnel_id }}">
                                            {{ $personnel->personnel_last_name }},
                                            {{ $personnel->personnel_first_name }}
                                </option>
                            @empty
                            <option disabled>No available personnel for new appointment</option>
                            @endforelse
                        </select>
                    </div>

                    <!-- Position -->
                    <div class="col-md-6">
                        <label class="form-label">Position</label>
                        <select name="job_position_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Position</option>
                            @foreach($positions as $position)
                                <option value="{{ $position->job_position_id }}">
                                    {{ $position->job_position_title }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Employment Status -->
                    <div class="col-md-4">
                        <label class="form-label">Employment Status</label>
                        <select name="employment_status_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Status</option>
                            @foreach($employmentStatuses as $status)
                                <option value="{{ $status->employment_status_id }}">
                                    {{ $status->employment_status_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Station -->
                    <div class="col-md-4">
                        <label class="form-label">Station</label>
                        <select id="station_select"
                            name="station_id_record_of_appointment_fk"
                            class="form-select">

                            <option value="">Select Station</option>

                            @foreach($stations as $station)
                                <option value="{{ $station->station_id }}">
                                    {{ $station->station_code }} |
                                    {{ $station->station_name }}
                                    ({{ $station->stationType->station_type_name }})
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Branch -->
                    <div class="col-md-4">
                        <label class="form-label">Branch</label>
                        <select name="branch_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Branch</option>
                            @foreach($branches as $branch)
                                <option value="{{ $branch->branch_id }}">
                                    {{ $branch->branch_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Nature of Appointment -->
                    <div class="col-md-4">
                        <label class="form-label">Nature of Appointment</label>
                        <select name="nature_of_appointment_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Nature</option>
                            @foreach($natureOfAppointments as $nature)
                                <option value="{{ $nature->nature_of_appointment_id }}">
                                    {{ $nature->nature_of_appointment_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Vice Type -->
                    <div class="col-md-4">
                        <label class="form-label">Vice Type</label>
                        <select name="vice_type_id_record_of_appointment_fk" class="form-select">
                            <option value="">Select Vice Type</option>
                            @foreach($viceTypes as $vice)
                                <option value="{{ $vice->vice_type_id }}">
                                    {{ $vice->vice_type_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Appointment Status -->
                    <input type="hidden" name="appointment_status_id_record_of_appointment_fk" value="{{ $activeStatus->appointment_status_id }}">

                    <div class="col-md-4">
                        <label class="form-label">Appointment Status</label>
                        <p class="form-control-plaintext text-success fw-bold">
                            Active
                        </p>
                    </div>

                    <!-- Date of Appointment -->
                    <div class="col-md-4">
                        <label class="form-label">Date of Appointment</label>
                        <input type="date" name="date_of_appointment" class="form-control">
                    </div>

                    <!-- Plantilla Item No -->
                    <div class="col-md-4">
                        <label class="form-label">Plantilla Item No.</label>
                        <input type="text" name="plantilla_item_no" class="form-control">
                    </div>

                    <!-- Vice Predecessor -->
                    <div class="col-md-4">
                        <label class="form-label">Vice Predecessor Name</label>
                        <input type="text" name="vice_predecessor_name" class="form-control">
                    </div>

                </div>
            </div>
        </div>

        <!-- SUBMIT -->
        <div class="text-end">
            <button type="submit" class="btn btn-primary px-5">
                Save Appointment
            </button>
        </div>

    </form>

</div>

@endsection
@push('scripts')
<script>
    new TomSelect("#station_select", {
        create: false,
        sortField: {
            field: "text",
            direction: "asc"
        },
        onChange: function() {
            this.blur(); // removes focus, stops blinking cursor
        },
        onItemAdd: function() {
            setTimeout(() => {
                this.control.blur();
            }, 0);
        }
    });
</script>
@endpush