@props(['for' => null])

@if($for && $errors->has($for))
    <p {{ $attributes->merge(['class' => 'text-sm text-red-600 dark:text-red-400']) }}>
        {{ $errors->first($for) }}
    </p>
@endif