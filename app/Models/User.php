<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id
 * @property string $user_name
 * @property string $contact
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Toy[] $toys
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';

	protected $fillable = [
		'user_name',
		'contact'
	];

	public function toys()
	{
		return $this->hasMany(Toy::class);
	}
}
