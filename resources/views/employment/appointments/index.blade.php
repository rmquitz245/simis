@extends('layouts.app')

@section('title', 'Appointments & Movements')

@section('content')

<div class="container-fluid">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h3>Appointments & Movements</h3>

        <!-- ONLY HERE is your Add button -->
        <a href="{{ route('appointments.create') }}" class="btn btn-primary">
            + Add New Appointment
        </a>

    </div>

    <div class="card">

        <div class="card-header">
            Appointment Records
        </div>

        <div class="card-body">

            <table class="table table-bordered table-striped">

                <thead>
                    <tr>
                        <th>Personnel</th>
                        <th>Position</th>
                        <th>Station</th>
                        <th>Effectivity Date</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                    @foreach($appointments as $appointment)

                        <tr>

                            <td>
                                {{ $appointment->personnel->personnel_last_name ?? '' }},
                                {{ $appointment->personnel->personnel_first_name ?? '' }}
                            </td>

                            <td>
                                {{ $appointment->jobPosition->job_position_title ?? '' }}
                            </td>

                            <td>
                                {{ $appointment->station->station_code ?? '' }} | {{ $appointment->station->station_name ?? '' }}
                            </td>

                            <td>
                                {{ \Carbon\Carbon::parse($appointment->date_of_appointment)->format('Y-m-d') }}
                            </td>

                            <td>
                                {{ $appointment->appointmentStatus->appointment_status_name ?? '' }}
                            </td>

                        </tr>

                    @endforeach

                </tbody>

            </table>

        </div>

    </div>

</div>

@endsection