<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Toy
 * 
 * @property int $id
 * @property string $toy_name
 * @property string $status
 * @property string $exchange_to
 * @property int $user_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 * @property Collection|Image[] $images
 *
 * @package App\Models
 */
class Toy extends Model
{
	protected $table = 'toys';

	protected $casts = [
		'user_id' => 'int'
	];

	protected $fillable = [
		'toy_name',
		'status',
		'exchange_to',
		'user_id'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function images()
	{
		return $this->hasMany(Image::class);
	}
}
