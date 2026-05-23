<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Appointment; // ✔ REQUIRED
use App\Models\Personnel;
use App\Models\JobPosition;
use App\Models\EmploymentStatus;
use App\Models\Station;
use App\Models\NatureOfAppointment;
use App\Models\ViceType;
use App\Models\AppointmentStatus;
use App\Models\Branch;


class AppointmentController extends Controller
{
    public function create()
    {
        $personnels = Personnel::availableForAppointment()->get();

        $positions = JobPosition::all();

        $employmentStatuses = EmploymentStatus::all();

        $stations = Station::all();

        $natureOfAppointments = NatureOfAppointment::all();

        $viceTypes = ViceType::all();

        $appointmentStatuses = AppointmentStatus::all();

        $branches = Branch::all();
        $stations = Station::with('stationType')->get();
        $activeStatus = AppointmentStatus::where('appointment_status_name', 'Active')->first();
        $appointments = Appointment::with('station')->get();
        return view(
            'employment.appointments.create',
            compact(
                'personnels',
                'positions',
                'employmentStatuses',
                'stations',
                'natureOfAppointments',
                'viceTypes',
                'appointmentStatuses',
                'branches',
                'activeStatus'
            )
        );

    }
    public function index()
    {
    $appointments = Appointment::with([
        'personnel',
        'jobPosition',
        'station'
    ])->get();

    return view('employment.appointments.index', compact('appointments'));
    }
    public function scopeAvailableForAppointment($query)
    {
    return $query->whereDoesntHave('appointments', function ($q) {
        $q->where('appointment_status_id_record_of_appointment_fk', 1); // Active
    });
    }
    public function store(Request $request)
    {
        // ✔ Step 1: Validate input
        $validated = $request->validate([
            'personnel_id_record_of_appointment_fk' => 'required|integer',
            'job_position_id_record_of_appointment_fk' => 'required|integer',
            'employment_status_id_record_of_appointment_fk' => 'required|integer',
            'station_id_record_of_appointment_fk' => 'required|integer',
            'branch_id_record_of_appointment_fk' => 'required|integer',
            'nature_of_appointment_id_record_of_appointment_fk' => 'required|integer',
            'vice_type_id_record_of_appointment_fk' => 'required|integer',
            'appointment_status_id_record_of_appointment_fk' => 'required|integer',
            'date_of_appointment' => 'required|date',
            'plantilla_item_no' => 'required|string|max:255',
            'vice_predecessor_name' => 'nullable|string|max:255',
        ]);

        // ✔ Step 2: BUSINESS RULE CHECK (ADD THIS PART ONLY)
        $exists = Appointment::where('personnel_id_record_of_appointment_fk', $validated['personnel_id_record_of_appointment_fk'])
            ->where('appointment_status_id_record_of_appointment_fk', 1)
            ->exists();

        if ($exists) {
            return back()->withErrors([
                'personnel_id_record_of_appointment_fk' => 'This personnel already has an active appointment.'
            ])->withInput();
        }
        // ✔ Step 3: Save to database
        Appointment::create($validated);

        // ✔ Step 4: Redirect back with success message
        return redirect()
            ->route('appointments.create')
            ->with('success', 'Appointment successfully created.');
        }
}