<div class="panel panel-default">
    <div class="panel-heading">
        <div class="pull-left" :class="{ 'btn-table-align': hasMonthlyAndYearlyPlans }">
            Subscribe
        </div>
        <div class='pull-right' style='margin-right:1em'><a class='btn btn-xs btn-info' target="_blank"
                title='How To Subscribe' href='https://blognist800171.files.wordpress.com/2018/04/171-subscribing.mp4'><i
                    class="fa fa-fw fa-btn fa-video-camera"></i></a></div>
        <!-- Interval Selector Button Group -->
        <div class="pull-right">
            <div class="btn-group" v-if="hasMonthlyAndYearlyPaidPlans">
                <!-- Monthly Plans -->
                <button type="button" class="btn btn-default" @click="showMonthlyPlans"
                    :class="{ 'active': showingMonthlyPlans }">

                    Monthly
                </button>

                <!-- Yearly Plans -->
                <button type="button" class="btn btn-default" @click="showYearlyPlans"
                    :class="{ 'active': showingYearlyPlans }">

                    Yearly
                </button>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="panel-body table-responsive">
        <!-- Subscription Notice -->
        <div class="p-b-lg">
            You are not subscribed to a plan. Choose from the plans below to get started.
        </div>

        <!-- European VAT Notice -->
        @if (Spark::collectsEuropeanVat())
            <p class="p-b-lg">
                All subscription plan prices are excluding applicable VAT.
            </p>
        @endif

        <!-- Plan Error Message -->
        <div class="alert alert-danger" v-if="form.errors.has('plan')">
            @{{ form.errors.get('plan') }}
        </div>

        <table class="table table-borderless m-b-none">
            <thead></thead>
            <tbody>
                @foreach (Spark::teamPlans() as $plan)
                <tr>
                    <!-- Plan Name -->
                    <td>
                        <div class="btn-table-align" onclick="showPlanDetails({{ $plan->id }})">
                            <span style="cursor: pointer;">
                                <strong>{{ $plan->name }}</strong>
                            </span>
                        </div>
                    </td>
        
                    <!-- Plan Features Button -->
                    <td>
                        <button class="btn btn-default m-l-sm" @click="showPlanDetails({{ json_encode($plan) }})">
                            <i class="fa fa-btn fa-star-o"></i>Plan Features
                        </button>
                    </td>
        
                    <!-- Plan Price -->
                    <td>
                        <div class="btn-table-align">
                            {{ $plan->price }}$ / {{ ucfirst($plan->interval) }}
                        </div>
                    </td>
        
                    <!-- Trial Days -->
                    <td>
                        @if ($plan->trialDays && !App\Helpers\StripeHelper::isSubscribed(auth()->user()->email))
                        <div class="btn-table-align">
                            {{ $plan->trialDays }} Day Trial
                        </div>
                        @endif
                    </td>
        
                    <!-- Plan Select Button -->
                    <td class="text-right">
                        @if (App\Helpers\StripeHelper::isSubscribed(auth()->user()->email,$plan->id))
                        <button type="submit" class="btn btn-success btn-plan">
                            Subscribed
                        </button>
                        @else
                        <form action="{{ route('checkout.process') }}" method="POST">
                            @csrf
                            <input type="hidden" value="{{ auth()->user()->name }}" name="name">
                            <input type="hidden" value="{{ auth()->user()->email }}" name="email">
                            <textarea style="display: none" name="amount">{{ $plan->price }}</textarea>
                            <textarea style="display: none" name="plan_id">{{ $plan->id }}</textarea>
                            <button type="submit" class="btn btn-primary-outline btn-plan">
                                Select
                            </button>
                        </form>
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
