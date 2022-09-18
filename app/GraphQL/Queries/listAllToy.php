<?php

declare(strict_types=1);

namespace App\GraphQL\Queries;

use App\Models\Toy;
use Closure;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Query;
use Rebing\GraphQL\Support\SelectFields;

class listAllToy extends Query
{
    protected $attributes = [
        'name' => 'listAllToy',
        'description' => 'A query'
    ];

    public function type(): Type
    {
        return GraphQL::paginate('Toy');
    }

    public function args(): array
    {
        return [
            'count' => [
                'type' => Type::int(),
            ],
            'page' => [
                'type' => Type::int(),
            ]
        ];
    }

    public function resolve($root, array $args, $context, ResolveInfo $resolveInfo, Closure $getSelectFields)
    {
        /** @var SelectFields $fields */
        $fields = $getSelectFields();
        $select = $fields->getSelect();
        $with = $fields->getRelations();

        $result = Toy::select($select)->paginate($args['count'], ['*'], 'page', $args['page']);


        return $result;
    }
}
