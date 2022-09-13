<div class="container">
	[
	<div class="ticker-wrap">
		<div class="ticker">
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
			<div class="ticker__item">FUCK DJS /</div>
			<div class="ticker__item">JUST DIG /</div>
		</div>
	</div>
	]
</div>

<style>
	@-webkit-keyframes ticker {
		0% {
			-webkit-transform: translate(0);
			transform: translate(0);
			visibility: visible;
		}

		100% {
			-webkit-transform: translate(calc(-100% - 1rem));
			transform: translate(calc(-100% - 1rem));
		}
	}

	@keyframes ticker {
		0% {
			-webkit-transform: translate(0);
			transform: translate(0);
			visibility: visible;
		}

		100% {
			-webkit-transform: translate(calc(-100% - 1rem));
			transform: translate(calc(-100% - 1rem));
		}
	}

	.container {
		display: flex;
		align-items: center;
		pointer-events: none;
	}

	.ticker-wrap {
		display: flex;
		overflow: hidden;
		height: 4rem;
		margin: 0 0.5rem;
	}

	.ticker {
		height: 4rem;
		line-height: 4rem;
		white-space: nowrap;
		box-sizing: content-box;
	}

	.ticker {
		-webkit-animation-iteration-count: infinite;
		animation-iteration-count: infinite;
		-webkit-animation-timing-function: linear;
		animation-timing-function: linear;
		-webkit-animation-name: ticker;
		animation-name: ticker;
		-webkit-animation-duration: var(--ticker-duration);
		animation-duration: var(--ticker-duration);
	}

	.ticker__item {
		font-feature-settings: 'ss02' on;
		display: inline-block;
		padding: 0 0;

		font-style: normal;
		font-weight: 400;
		font-size: 15px;
		line-height: 110%;
		letter-spacing: 0.05em;
		text-transform: uppercase;
	}
</style>
