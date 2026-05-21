<?php

namespace App\Http\Controllers;

use App\Models\Personnel;
use App\Models\Sex;
use App\Models\CivilStatus;
use App\Models\Barangay;
use App\Models\Municipality;
use App\Models\Province;
use App\Models\Region;
use Illuminate\Http\Request;

class PersonnelController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $personnel = Personnel::with(['sex', 'civilStatus'])->get();

        return view('personnel.index', compact('personnel'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $sexes = Sex::all();
        $civilStatuses = CivilStatus::all();
        $regions = Region::all();
        $provinces = Province::all();
        $municipalities = Municipality::all();
        $barangays = Barangay::all();

        return view('personnel.create', compact(
            'sexes',
            'civilStatuses',
            'regions',
            'provinces',
            'municipalities',
            'barangays'
        ));
        
    }
    public function getProvinces($regionId)
    {
        return Province::select(
            'province_id as id',
            'province_name'
        )
        ->where('region_id_province_fk', $regionId)
        ->get();
    }
    /*public function getProvinces($regionId)
    {
        dd($regionId);
    }*/
    public function getMunicipalities($provinceId)
    {
        return Municipality::select(
            'municipality_id as id',
            'municipality_name'
        )
        ->where('province_id_municipality_fk', $provinceId)
        ->get();
    }
    public function getBarangays($municipalityId)
    {
        return Barangay::select(
            'barangay_id as id',
            'barangay_name'
        )
        ->where('municipality_id_barangay_fk', $municipalityId)
        ->get();
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();

    Personnel::create([
        'personnel_last_name' => $data['personnel_last_name'],
        'personnel_first_name' => $data['personnel_first_name'],
        'personnel_middle_name' => $data['personnel_middle_name'],

        'sex_id_personnel_fk' => $data['sex_id_personnel_fk'],
        'civil_status_id_personnel_fk' => $data['civil_status_id_personnel_fk'],

        'personnel_birthdate' => $data['personnel_birthdate'],
        'birth_place' => $data['birth_place'],

        'permanent_address_barangay_id' => $data['permanent_address_barangay_id'],
        'permanent_address_street' => $data['permanent_address_street'],
        'permanent_address_subdivision_village' => $data['permanent_address_subdivision_village'],
        'permanent_address_house_block_lot_no' => $data['permanent_address_house_block_lot_no'],

        'present_address_barangay_id' => $data['present_address_barangay_id'],
        'present_address_street' => $data['present_address_street'],
        'present_address_subdivision_village' => $data['present_address_subdivision_village'],
        'present_address_house_block_lot_no' => $data['present_address_house_block_lot_no'],

        'umid_id_no' => $data['umid_id_no'],
        'pag_ibig_no' => $data['pag_ibig_no'],
        'phil_health_no' => $data['phil_health_no'],
        'phil_sys_no' => $data['phil_sys_no'],
        'tin_no' => $data['tin_no'],

        'employee_no' => $data['employee_no'],
    ]);

    return redirect()->back()->with('success', 'Personnel saved successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Personnel $personnel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Personnel $personnel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Personnel $personnel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Personnel $personnel)
    {
        //
    }
}
