<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Barangay extends Model
{
    protected $table = 'barangay';

    public function permanentResidents()
    {
        return $this->hasMany(Personnel::class, 'permanent_address_barangay_id');
    }

    public function presentResidents()
    {
        return $this->hasMany(Personnel::class, 'present_address_barangay_id');
    }
    public function municipality()
    {
        return $this->belongsTo(Municipality::class, 'municipality_id_barangay_fk');
    }
}