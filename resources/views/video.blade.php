@extends('layouts.app')

@section('content')
    @include('layouts.announcement')
    <videos categories="{{ $categories }}"></videos>
    @include('layouts.footer')
@endsection