<?php

declare(strict_types=1);

namespace App\GraphQL\Mutations;

use App\Models\Toy;
use Closure;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Mutation;
use Rebing\GraphQL\Support\SelectFields;

class deactivateToy extends Mutation
{
    protected $attributes = [
        'name' => 'deactivateToy',
        'description' => 'A mutation'
    ];

    public function type(): Type
    {
        return Type::listOf(Type::string());
    }

    public function args(): array
    {
        return [
            'id' => [
                'type' => Type::int(),
            ]
        ];
    }

    public function resolve($root, array $args)
    {

        $toy = Toy::find($args['id']);
        if(!$toy){
            return ["There is no toy with this id"];
        }
        else if($toy->status === "inactive"){
            return ["this toy is already disabled"];
        }
        else{
            $toy->status = 'inactive';

            $toy->update();

            return [$toy->toy_name . " is disable successfully"];
        }


    }
}
