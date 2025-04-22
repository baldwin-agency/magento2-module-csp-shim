<?php

declare(strict_types=1);

namespace Magento\Csp\Api;

interface PolicyCollectorInterface
{
    public function collect(array $defaultPolicies = []): array;
}
