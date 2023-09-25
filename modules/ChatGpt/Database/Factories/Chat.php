<?php

namespace Modules\ChatGpt\Database\Factories;

use App\Abstracts\Factory;
use Modules\ChatGpt\Models\Chat as Model;

class Chat extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Model::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'company_id' => $this->company->id,
            'title' => $this->faker->text(15),
            'parent_id' => $this->faker->randomNumber(1, 2),
            'content' => $this->faker->text(100),
            'type' => $this->faker->randomNumber(0, 1),
            'created_from' => 'core::factory',
        ];
    }
}
