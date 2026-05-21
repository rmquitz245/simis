<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Municipality extends Model
{
    protected $table = 'municipality';

    public function personnel()
    {
        return $this->hasMany(Personnel::class, 'birth_place');
    }
     public function province()
    {
        return $this->belongsTo(
            Province::class,
            'province_id_municipality_fk'
        );
    }

    public function barangays()
    {
        return $this->hasMany(
            Barangay::class,
            'municipality_id_barangay_fk'
        );
    }
}