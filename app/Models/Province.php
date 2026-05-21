<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    protected $table = 'province';

    public function region()
    {
        return $this->belongsTo(Region::class, 'region_id_province_fk');
    }
    public function municipalities()
    {
        return $this->hasMany(
            Municipality::class,
            'province_id_municipality_fk'
        );
    }
}