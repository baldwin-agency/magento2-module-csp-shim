<?php

declare(strict_types=1);

namespace Magento\Csp\Api;

use Magento\Framework\App\ActionInterface;

interface CspAwareActionInterface extends ActionInterface
{
    public function modifyCsp(array $appliedPolicies): array;
}
