<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function setImagesAttribute($images)
    {
        if (is_array($images)) {
            $this->attributes['images'] = json_encode($images);
        }
    }

    public function getImagesAttribute($images)
    {
        return json_decode($images, true);
    }
}
