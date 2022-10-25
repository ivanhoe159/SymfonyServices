<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Usermoney;
use App\Entity\Transactions;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;

class MainController extends AbstractController {
    public function balance(ManagerRegistry $doctrine)
    {
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
            'services' => $services,
        ]);
    }
    public function service(ManagerRegistry $doctrine)
    {
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }
}
