<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Usermoney;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Repository\ServiceRepository;
use App\Repository\UsermoneyRepository;
use Doctrine\Persistence\ManagerRegistry;

class MainController extends AbstractController {
    public function balance(ManagerRegistry $doctrine)
    {
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
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
